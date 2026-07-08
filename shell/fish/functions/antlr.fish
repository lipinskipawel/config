function antlr
  docker run -it -u '(id -u {$USER})':'(id -g {$USER})' -v '(pwd)':/work antlr/antlr4 $argv
end
