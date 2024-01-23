This section of code will call the module ecr to create the ecr repository in AWS.

The parameters for the module are 
  ecr_name         = The name for this container registry
  image_mutability = image_mutability
  tags             = AWS tags to use
  