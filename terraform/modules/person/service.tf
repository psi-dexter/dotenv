variable rent {
  type = object({
    Name = string
    defenition_uri = string
    POS_url        = string
    items    = list(any)
    persons  = list(any)
    deadline = string
  })
  default = {
    Name = "rent"