function tar --description 'alias tar=env COPYFILE_DISABLE=true tar'
  env COPYFILE_DISABLE=true tar $argv; 
end
