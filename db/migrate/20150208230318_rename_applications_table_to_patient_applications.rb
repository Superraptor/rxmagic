class RenameApplicationsTableToPatientApplications < ActiveRecord::Migration
  def change
    rename_table :applications, :patient_applications
  end
end
