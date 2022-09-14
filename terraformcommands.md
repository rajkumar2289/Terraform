terraform init -input=false 				#to initialize the working directory.
terraform plan -out=tfplan -input=false 	#to create a plan and save it to the local file tfplan.
terraform apply -input=false tfplan 		#to apply the plan stored in the file tfplan
terraform apply -input=false --auto-approve
terraform validate
terraform get 								#command is used to download and update modules mentioned in the root module.
terraform get -update  						# If specified, modules that are already downloaded will be checked for updates and the updates will be downloaded if present.
terraform fmt   							#command is used to rewrite Terraform configuration files to a canonical format and style.
terraform validate  -json  					#command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc
terraform show  -json						#command is used to provide human-readable output from a state or plan file.
terraform state list  						#command is used to list resources within a Terraform state.
=========filtering by resources and module=======
terraform state list aws_instance.bar
terraform state list module.elb

terraform refresh            				#command reads the current settings from all managed remote objects and updates the Terraform state to match.
terraform apply -refresh-only

terraform taint 				       		#command informs Terraform that a particular object has become degraded or damaged. Terraform represents this by marking the object as "tainted" in the Terraform state, in which case Terraform will propose to replace it in the next plan you create.
terraform apply -replace="aws_instance.example[0]"
terraform untaint 							#to remove the taint marker from that object.
terraform state show   						#command is used to show the attributes of a single resource in the Terraform state.
terraform state show 'packet_device.worker'

terraform state replace-provider 			#command is used to replace the provider for resources in a Terraform state.
											Ex: terraform state replace-provider hashicorp/aws registry.acme.corp/acme/aws

terraform state pull 						#command is used to manually download and output the state from remote state. This command also works with local state.
#This command will download the state from its current location, upgrade the local copy to the latest state file version that is compatible with locally-installed Terraform, and output the raw format to stdout.
#This is useful for reading values out of state (potentially pairing this command with something like jq). It is also useful if you need to make manual modifications to state. 
 
terraform state push 						#command is used to manually upload a local state file to remote state. This command also works with local state.
terraform force-unlock -force LOCK_ID [DIR] #Manually unlock the state for the defined configuration.
 
terraform plan -target="random_pet.bucket_name"  #You can use Terraform's -target option to target specific resources, modules, or collections of resources.
terraform plan -out=myplan

terraform apply -target="random_pet.bucket_name"
terraform apply -target="aws_s3_bucket_object.objects[2]" -target="aws_s3_bucket_object.objects[3]"
terraform apply -var-file="prod.tfvars" -auto-approve


terraform workspace new Dev                #terraform workspace command is used to manage workspaces.
terraform workspace list
terraform workspace select Prod
terraform workspace delete Test -force
terraform workspace show


terraform plan -destroy            #create a speculative destroy plan, to see what the effect of destroying would be
terraform apply -destroy

