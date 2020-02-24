brew install terraform || echo got one
git clone https://github.com/psi-dexter/dotenv.git 
cd dotenv/terraform/modules/dotenv
terraform init
terraform apply auto-aprove 
