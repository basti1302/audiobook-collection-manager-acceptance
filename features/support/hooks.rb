#encoding: utf-8
#require_relative 'storage.rb'

Before do
  delete_database backend_url('audiobooks')
end

After do
  delete_database backend_url('audiobooks')
end
