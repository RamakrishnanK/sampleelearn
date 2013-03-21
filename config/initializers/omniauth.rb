Rails.application.config.middleware.use OmniAuth::Builder do
 if Rails.env.production?
   provider :facebook, ' 552681548087124', '3c28c5c7a9c433be00432ad3173de8b4'
   provider :linkedin, 'gl1h6zyltlem', "wIfucZImlYGqFO3r"
   provider :google_oauth2, '928801233183-dg701idms6tr6907bk6m2i8boishu4io.apps.googleusercontent.com', 'n61XG48z1DMc6kGiY6zCuiUM'
   
 elsif Rails.env.development?
   provider :facebook, '552681548087124', '3c28c5c7a9c433be00432ad3173de8b4'
   provider :linkedin, '31azcdigi8tt', "OKd1hmuJoNOg9J2g"
   provider :google_oauth2, '928801233183', '-nMQ0dEfcaBITxzwYHZPQ3v-'
 end
 
end