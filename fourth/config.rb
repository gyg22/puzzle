#encoding: utf-8

module Config
  DataMapper.setup(:default, "sqlite://#{Dir.pwd}/dev.sqlite3")
end

