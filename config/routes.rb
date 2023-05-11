Rails.application.routes.draw do



  # Routes for the Mass email resource:

  # CREATE
  post("/insert_mass_email", { :controller => "mass_emails", :action => "create" })
          
  # READ
  get("/mass_emails", { :controller => "mass_emails", :action => "index" })
  
  get("/mass_emails/:path_id", { :controller => "mass_emails", :action => "show" })
  
  # UPDATE
  
  post("/modify_mass_email/:path_id", { :controller => "mass_emails", :action => "update" })
  
  # DELETE
  get("/delete_mass_email/:path_id", { :controller => "mass_emails", :action => "destroy" })

  #------------------------------

  # Routes for the Attendance record resource:

  # CREATE
  post("/insert_attendance_record", { :controller => "attendance_records", :action => "create" })
          
  # READ
  get("/attendance_records", { :controller => "attendance_records", :action => "index" })
  
  get("/attendance_records/:path_id", { :controller => "attendance_records", :action => "show" })
  
  # UPDATE
  
  post("/modify_attendance_record/:path_id", { :controller => "attendance_records", :action => "update" })
  
  # DELETE
  get("/delete_attendance_record/:path_id", { :controller => "attendance_records", :action => "destroy" })

  #------------------------------

  # Routes for the Note resource:

  # CREATE
  post("/insert_note", { :controller => "notes", :action => "create" })
          
  # READ
  get("/notes", { :controller => "notes", :action => "index" })
  
  get("/notes/:path_id", { :controller => "notes", :action => "show" })
  
  # UPDATE
  
  post("/modify_note/:path_id", { :controller => "notes", :action => "update" })
  
  # DELETE
  get("/delete_note/:path_id", { :controller => "notes", :action => "destroy" })

  #------------------------------

  # Routes for the Image resource:

  # CREATE
  post("/insert_image", { :controller => "images", :action => "create" })
          
  # READ
  get("/images", { :controller => "images", :action => "index" })
  
  get("/images/:path_id", { :controller => "images", :action => "show" })
  
  # UPDATE
  
  post("/modify_image/:path_id", { :controller => "images", :action => "update" })
  
  # DELETE
  get("/delete_image/:path_id", { :controller => "images", :action => "destroy" })

  #------------------------------

  # Routes for the Child resource:

  # CREATE
  post("/insert_child", { :controller => "children", :action => "create" })
          
  # READ
  get("/children", { :controller => "children", :action => "index" })
  
  get("/children/:path_id", { :controller => "children", :action => "show" })
  
  # UPDATE
  
  post("/modify_child/:path_id", { :controller => "children", :action => "update" })
  
  # DELETE
  get("/delete_child/:path_id", { :controller => "children", :action => "destroy" })

  #------------------------------

  # Routes for the User resource:

  # CREATE
  post("/insert_user", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })

  #------------------------------

end
