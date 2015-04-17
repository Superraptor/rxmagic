require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/png_outputter'
require 'barby/outputter/prawn_outputter'
require 'barby/outputter/pdfwriter_outputter'

# require 'barby/barcode/EAN13'
# require 'barby/outputter/ascii_outputter'
# require 'barby/outputter/html_outputter'
require 'rubygems'
require 'rghost'
require 'rghost_barcode'
require "rghost/cursor"
require "rghost/text_in"
require "rghost/ps_facade"

class DispensedMedsController < ApplicationController
  before_action :set_dispensed_med, only: [:show, :edit, :update, :destroy]
  before_action :load_activities, only: [:index, :show, :new, :edit]

  include RGhost

  # GET /dispensed_meds
  # GET /dispensed_meds.json
  def index
    @dispensed_meds = DispensedMed.all
  end

  # GET /dispensed_meds/1
  # GET /dispensed_meds/1.json
  def show
    @redirect_url = '../rghost-39'
    @redirect_delay = 0
  end

  # GET /dispensed_meds/new
  def new
    @dispensed_med = DispensedMed.new
    
    @dispensed_med.patientsid = params[:ptid]
  end

  # GET /dispensed_meds/1/edit
  def edit
  end

  # POST /dispensed_meds
  # POST /dispensed_meds.json
  def create
    @dispensed_med = DispensedMed.new(dispensed_med_params)
    
    respond_to do |format|
      if @dispensed_med.save
        inventoryid = @dispensed_med.inventoryid
        
        puts "THIS IS THE INVENTORY ID: "
        puts inventoryid
        
        # Inventory.find_by(inventoryid).decrement(:currentstock, 1)
        puts "THIS IS THE OLD CURRENT STOCK: "
        puts Inventory.where(invid: inventoryid).pluck(:currentstock)[0].to_i
        
        puts "THIS IS THE QUANTITY SUBTRACTED: "
        puts @dispensed_med.quantity.to_i
        newcurrentstock = Inventory.where(invid: inventoryid).pluck(:currentstock)[0].to_i - @dispensed_med.quantity.to_i
        
        puts "THIS IS THE CURRENT STOCK: "
        puts newcurrentstock
        
        @inventory = Inventory.find_by(invid: inventoryid)

        @patient = Patient.find_by(ptid: @dispensed_med.patientsid)
        
        @medicationsrxnormndc = MedicationsRxNorm.find_by(ndc: @inventory.medicationsrxnormndc)
        
        if(@inventory.currentstock.to_i < 0)
          flash.now[:alert] = 'ERROR: Current stock cannot be negative. Medication not dispensed. Please update inventory and try again.'
          
        elsif(@inventory.currentstock.to_i < @medicationsrxnormndc.minstock.to_i)
          puts "THIS IS THE ELSIF STATEMENT"
          @inventory.update(currentstock: "#{newcurrentstock}")
          flash.now[:alert] = 'Current stock is now less than minimum stock. Please reorder.'
          # Create notification for reorder.
          @inventory.create_activity key: 'inventory.reorder'
          @inventory.update(currentstock: "#{newcurrentstock}")
          
          puts "DID IT WORK???????"
          
          barcode_value = "#{@inventory.id}"
          full_path = "./barcode_#{barcode_value}.pdf"
          barcode = Barby::Code39.new(barcode_value)
          File.open(full_path, 'w') { |f| f.write barcode.to_pdf(:margin => 3, :xdim => 2, :height => 55) }
          full_path.print()
          
          # @barcode = Barby::EAN13.new("#{@inventory.invid}")
          # @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
          
          # doc = RGhost::Document.new
          # doc.barcode_code39("#{@inventory.invid}", :x => 5, :y => 20, :width => 5)
          # doc.render(:pdf, :filename => "rghost-39.pdf")
          
          # pdf = PDF::Writer.new(:paper => [21, 29.7])
          # pdf.trim_box(0, 0, 21, 29.7)
          
          # barcode = Barby::Code39.new("#{@inventory.invid}")
          # barcode.annotate_pdf(pdf, :x => 200, :y => 600, :width => 5)
          
          # pdf.save_as('barby-39.pdf').print()
          
          # directions = ""
          # directions2 = ""
          # directions3 = ""
          # dfirst = ""
          # dlast = ""
          
          # printer="/dev/usb/lp0";
          
          # string = "N" + "13" + "10" + "q609" + "13" + "10" + "Q406,026" + "13" + "10" + "ZT" + "13" + "10" + "B600,25,1,1,4,10,100,N,\"#{@inventory.invid}\"" + "13" + "10" + "A50,30,0,2,2,2,N,\"#{@patient.lastname}, #{@patient.firstname}\"" + "13" + "10" + "A50,76,0,2,1,2,N,\"Dispensed: #{Date.today.to_s} \"" + "13" + "10" + "A50,122,0,2,2,2,N,\"#{@medicationsrxnormndc.medname}" + "\"" + "13" + "10" + "A50,168,0,2,1,2,N,\"Directions:#{directions}\"" + "13" + "10" + "A50,214,0,2,1,2,N,\"#{directions2}\"" + "13" + "10" + "A50,260,0,2,1,2,N,\"#{directions3}\"" + "13" + "10" + "A50,306,0,2,1,2,N,\"Quantity:#{@dispensed_med.quantity}" + "  Lot#: #{@inventory.lotno}\"" + "13" + "10" + "A50,355,0,2,1,2,N,\"Physician: Dr.#{dfirst} #{dlast}\"" + "13" + "10" + "P1" + "13" + "10"
          
          # file = File.open(printer, 'w');
          # file.write(string)
          # file.close
          
        else
          @inventory.update(currentstock: "#{newcurrentstock}")
          
          # barcode_value = "#{@inventory.id}"
          # full_path = "./barcode_#{barcode_value}.pdf"
          # barcode = Barby::Code39.new(barcode_value)
          # File.open(full_path, 'w') { |f| f.write barcode.to_pdf() }
          # full_path.print()
          
          # doc=RGhost::Document.new
          # doc.barcode_code128("#{@inventory.id}",{:text=>{:size=>8}, :parsefnc=>true, :enable=>[:text]})
          # doc.render :pdf, :resolution => 800, :filename => "my_barcode.pdf"
          # puts "DID IT WORK???????"
          # 'lpr my_barcode.pdf'
          
          doc = RGhost::Document.new
          # doc.text "Dispensed: #{@dispensed_med.disdate}<br>#{@patient.lastname}, #{@patient.firstname}<br><br>DIRECTIONS LINE 1 WILL BE HERE<br>DIRECTIONS LINE 2 WILL BE HERE<br>DIRECTIONS LINE 3 WILL BE HERE<br>#{@medicationsrxnormndc.medname}<br>PHARMACEUTICAL COMPANY WILL BE HERE<br>Lot#: #{@inventory.lotno}     Clinic: CLINIC WILL BE HERE.<br><br>Physician: PHYSICIAN WILL BE HERE."
          # doc.show 'Hello World' , :color => :blue
          
          # doc.define_tags do
          #   tag :font1, :name => 'Helvetica', :size => 10, :color => '#F34811'
          #   tag :font2, :name => 'Times',     :size => 14, :color => '#A4297A'
          #   tag :font3, :name => 'TimesBold', :size => 18, :color => '#AA3903'
          # end
          
          # doc = RGhost::PsObject.new
          # doc.newpath do
          # translate :x => 3, :y=> 4
          #   rotate 45
          #   text_in :x => 0, :y => 0, :write => "Foo Bar Baz1", :tag => :font2
          # end
          
          doc.define_tags do
            tag :my_italic,    :name => 'Hershey-Gothic-Italian-Oblique', :size => 10
            tag :myfont,       :name => 'Hershey-Plain'
            tag :verdana,      :name => 'Verdana', :from => "/my/path/verdana.ttf", :size => 12
            tag :font_encoded, :name => 'NimbusMonL-Regu', :size => 8, :color => 0.5,:encoding => true
            tag :other_font,   :name => 'NimbusMonL-Regu',    :size => 10
            tag :arial,        :name => 'Arial-ItalicMT',     :color => '#ADAD66'
            tag :arial_bold,   :name => 'NimbusSanL-BoldItal',:size => 12, :color => '#ADAD66'
            tag :font1, :name => 'Times', :size => 72, :color => '#000000'
          end
          
          # my_text = "<font1>Dispensed: #{@dispensed_med.disdate}<br/>#{@patient.lastname}, #{@patient.firstname}<br/><br/>DIRECTIONS LINE 1 WILL BE HERE<br/>DIRECTIONS LINE 2 WILL BE HERE<br/>DIRECTIONS LINE 3 WILL BE HERE<br/>#{@medicationsrxnormndc.medname}<br/>PHARMACEUTICAL COMPANY WILL BE HERE<br/>Lot#: #{@inventory.lotno}     Clinic: CLINIC WILL BE HERE.<br/><br/>Physician: PHYSICIAN WILL BE HERE.</font1>"
          
          
          doc.barcode_code39("#{@inventory.invid}", :text => {:size => 10, :offset => [0,-10], :enable => [:text, :check, :checkintext] }, :x => 1, :y => 25, :width => 19)
          # doc.text_area my_text, :x => 1, :y => 10
          
          doc.define_tags do
            tag :font1, :name => 'Helvetica', :size => 20, :color => '#000000'
            tag :font2, :name => 'Times',     :size => 11, :color => '#A4297A'
            tag :font3, :name => 'TimesBold', :size => 12, :color => '#AA3903'
          end
          # add some more line breaks...
          my_text="<font1>Dispensed: #{@dispensed_med.disdate}</font1><br/><font1>#{@patient.lastname}, #{@patient.firstname}</font1><br/><br/><br/><font1>DIRECTIONS LINE 1 WILL BE HERE</font1><br/><br/><font1>DIRECTIONS LINE 2 WILL BE HERE</font1><br/><br/><font1>DIRECTIONS LINE 3 WILL BE HERE</font1><br/><br/><font1>#{@medicationsrxnormndc.medname}</font1><br/><br/><font1>PHARMACEUTICAL COMPANY WILL BE HERE</font1><br/><br/><font1>Lot#: #{@inventory.lotno}     Clinic: CLINIC WILL BE HERE.</font1><br/><br/><br/><font1>Physician: PHYSICIAN WILL BE HERE.</font1>"
          doc.text_area my_text, :x => 1, :y => 10
          
          doc.render(:pdf, :filename => "rghost-39.pdf")
          
          # doc.render :eps9mid, :filename => "//machine/printer"
          
          # thumb = RGhost::Convert.new('rghost-39.pdf').to :png
          # out = doc.to :png  #returns File
          # if doc.error
          #   raise Exception.new "Image error"
          # else
          #   File.cp(out,"/public")
          # end
          doc.render(:png, :filename => "./public/rghost-39.png")
          # barcodepdf = File.open("./rghost-39.pdf")
          
          # pdf()
          
          # directions = ""
          # directions2 = ""
          # directions3 = ""
          # dfirst = ""
          # dlast = ""
          
          # printer="/dev/usb/lp0";
          
          # string = "N" + "13" + "10" + "q609" + "13" + "10" + "Q406,026" + "13" + "10" + "ZT" + "13" + "10" + "B600,25,1,1,4,10,100,N,\"#{@inventory.invid}\"" + "13" + "10" + "A50,30,0,2,2,2,N,\"#{@patient.lastname}, #{@patient.firstname}\"" + "13" + "10" + "A50,76,0,2,1,2,N,\"Dispensed: #{Date.today.to_s} \"" + "13" + "10" + "A50,122,0,2,2,2,N,\"#{@medicationsrxnormndc.medname}" + "\"" + "13" + "10" + "A50,168,0,2,1,2,N,\"Directions:#{directions}\"" + "13" + "10" + "A50,214,0,2,1,2,N,\"#{directions2}\"" + "13" + "10" + "A50,260,0,2,1,2,N,\"#{directions3}\"" + "13" + "10" + "A50,306,0,2,1,2,N,\"Quantity:#{@dispensed_med.quantity}" + "  Lot#: #{@inventory.lotno}\"" + "13" + "10" + "A50,355,0,2,1,2,N,\"Physician: Dr.#{dfirst} #{dlast}\"" + "13" + "10" + "P1" + "13" + "10"

          # file = File.open(printer, 'w')
          # file.write(string)
          # file.close
          
          
        end
        
        format.html { redirect_to @dispensed_med, notice: 'Dispensed med was successfully created.' }
        # format.json { render text: t.response }
        format.json { render :show, status: :created, location: @dispensed_med }

      else
        
        format.html { render :new }
        format.json { render json: @dispensed_med.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # def pdf
  #   pdf_filename = File.join(Rails.root, "./rghost-39.pdf")
  #   send_file(pdf_filename, :filename => "./rghost-39.pdf", :type => "application/pdf") and return
  # end

  # PATCH/PUT /dispensed_meds/1
  # PATCH/PUT /dispensed_meds/1.json
  def update
    respond_to do |format|
      if @dispensed_med.update(dispensed_med_params)
        format.html { redirect_to @dispensed_med, notice: 'Dispensed med was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispensed_med }
      else
        format.html { render :edit }
        format.json { render json: @dispensed_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispensed_meds/1
  # DELETE /dispensed_meds/1.json
  def destroy
    @dispensed_med.destroy
    respond_to do |format|
      format.html { redirect_to dispensed_meds_url, notice: 'Dispensed med was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dispensed_med
      @dispensed_med = DispensedMed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dispensed_med_params
      params.require(:dispensed_med).permit(:disdate, :patientsid, :inventoryid, :quantity, dispensed_med_attributes: [:quantity])
    end
    
    def load_activities
      @activities = PublicActivity::Activity.order('created_at DESC')
    end
end
