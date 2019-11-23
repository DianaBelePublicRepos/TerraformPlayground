
###  terraform plan
--- Dry run of the deployment without deploying

### terraform apply
--- Creating the configuration in the chosen provider

### terraform graph
--- Graphs the dependency tree of the deployment

### terraform destroy
--- Destroys all resources it identifies

### terraform fmt
--- Formats the .tf file in line with conventions

### Referencing variables
```
"${var.VARIABLE_NAME}"
var.VARIABLE_NAME 
```
### Interpolation
``` 
"${something to interpolate}"
```

### Defining an input variable
```
variable "NAME" {
  [CONFIG ....
  description = document how a variable is used
  type        = <String, list or map>
  default     = < Passing in values via the command line with -var OR via a file -var -file OR Environment Variable  
             in the  format TF_VAR_<variable_name> >
  ]
} 
```
##### Defining an output variable name
``` 
output "NAME" {
  value = VALUE
} 
```
