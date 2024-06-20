function get_microservices
  lbcgt microservice list | fzf | xargs lbcgt microservice get
end
