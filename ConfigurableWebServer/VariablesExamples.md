
### Example for list
```
variable "list_example" {
  description = "An example of a description blah blah"
  type        = "list"
  default     = [1,2,3]
}
```
### Example for map
```
variable "map_example" {
  description = "An example of a map's description"
  type        = "map"
  default     = {

    key1      = "value 1"
    key2      = "value 2"
    key3      = "value 3"

  }
}
```
### Example for String
Variable _Strings_ - numbers are automatically coerced to strings so the type can be omitted

### INPUT variable
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
### OUTPUT variable_name
```
output "NAME" {
  value = VALUE
}
```
### Referencing variables
```
var.VARIABLE_NAME
"${var.VARIABLE_NAME}"
```
