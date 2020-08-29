Rails.application.routes.draw do



  # Routes for the Threepl rec resource:

  # CREATE
  post("/insert_threepl_rec", { :controller => "threepl_recs", :action => "create" })
          
  # READ
  get("/threepl_recs", { :controller => "threepl_recs", :action => "index" })
  
  get("/threepl_recs/:path_id", { :controller => "threepl_recs", :action => "show" })
  
  # UPDATE
  
  post("/modify_threepl_rec/:path_id", { :controller => "threepl_recs", :action => "update" })
  
  # DELETE
  get("/delete_threepl_rec/:path_id", { :controller => "threepl_recs", :action => "destroy" })

  #------------------------------

  # Routes for the Threepl resource:

  # CREATE
  post("/insert_threepl", { :controller => "threepls", :action => "create" })
          
  # READ
  get("/threepls", { :controller => "threepls", :action => "index" })
  
  get("/threepls/:path_id", { :controller => "threepls", :action => "show" })
  
  # UPDATE
  
  post("/modify_threepl/:path_id", { :controller => "threepls", :action => "update" })
  
  # DELETE
  get("/delete_threepl/:path_id", { :controller => "threepls", :action => "destroy" })

  #------------------------------

  # Routes for the Product resource:

  # CREATE
  post("/insert_product", { :controller => "products", :action => "create" })
          
  # READ
  get("/products", { :controller => "products", :action => "index" })
  
  get("/products/:path_id", { :controller => "products", :action => "show" })
  
  # UPDATE
  
  post("/modify_product/:path_id", { :controller => "products", :action => "update" })
  
  # DELETE
  get("/delete_product/:path_id", { :controller => "products", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  #Homepage
  get("/", { :controller => "users", :action => "home"})

  #User Detail Page


end
