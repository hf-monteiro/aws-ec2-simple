include {
    path = find_in_parent_folders()
}

dependency "master" {
  config_path = "../rds-master"

  /*mock_outputs = {
    master_db_instance_id   = "master_db_instance_id"
  }
  skip_outputs              = true
}/*/
}
inputs = {
  master_db_instance_id = dependency.master.outputs.master_db_instance_id 
}
