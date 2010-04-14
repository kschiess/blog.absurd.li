#!/usr/bin/env ruby
# Encoding: UTF-8

require 'sqlite3'
require 'pg'

class AbstractDatabase
  def max_id(table)
    select_one("select max(id) from #{table}")
  end
end

class SqliteSource < AbstractDatabase
  attr_reader :handle
  
  def initialize(database_name)
    @handle = SQLite3::Database.new(database_name)
  end
  
  def select_one(sql)
    handle.execute(sql).first.first
  end
  
  def each_row(table, start_id)
    handle.execute("select * from #{table} where id>#{start_id} order by id ") do |row|
      yield row
    end
  end
end

class PostgresTarget < AbstractDatabase
  attr_reader :handle
  def initialize(host, user, password, database)
    @handle = PGconn.new(host, nil, '', '', database, user, password)
  end
  
  def select_one(sql)
    res = handle.exec(sql)
    res[0].values.first
  end
  
  def transaction
    begin
      handle.exec('BEGIN')
      yield
    rescue
      handle.exec('ROLLBACK')
      raise
    else
      handle.exec('END')
      # handle.exec('ROLLBACK')
    end
  end
  
  def nil_as_zero(row, idx)
    row[idx] = row[idx] || 0
  end
    
  def put_row(table, row)
    puts "put #{table}: #{row.inspect}"
    binds = (0...row.size).to_a.map { |i| "$#{i+1}" }
    
    case table
      when 'Templates'
        nil_as_zero row, 6  # translationof
      when 'Tickets'
        nil_as_zero row, 1
        nil_as_zero row, 2
        nil_as_zero row, 4
        nil_as_zero row, 5
        nil_as_zero row, 6
        nil_as_zero row, 8
        nil_as_zero row, 9
        nil_as_zero row, 10
        nil_as_zero row, 11
        nil_as_zero row, 12
        nil_as_zero row, 14
        nil_as_zero row, 20
        nil_as_zero row, 22
        nil_as_zero row, 24
      when 'Transactions'
        nil_as_zero row, 1
        nil_as_zero row, 2
        nil_as_zero row, 3
        nil_as_zero row, 12
    end
    
    handle.exec("INSERT INTO #{table.downcase} values (#{binds.join(', ')})", 
      row)
  end
end

class Synchronisation
  attr_reader :source, :target
  def initialize(source, target)
    @source, @target = source, target
  end
  
  def synch(table_name)
    source_max_id = source.max_id(table_name).to_i
    target_max_id = Integer(target.max_id(table_name) || 0)

    puts "#{table_name}: Source: #{source_max_id}, Target: #{target_max_id}"

    target.transaction do
      source.each_row(table_name, target_max_id) do |row|
        next unless (target_max_id..source_max_id).include?(row.first.to_i)
        
        target.put_row(table_name, row)
      end
    end
  end
end

source = SqliteSource.new(ARGV[0] || 'rt')
target = PostgresTarget.new('localhost', 'USERNAME', 'PASSWORD', 'rt3')

synch = Synchronisation.new(source, target)
%w(
ACL                      Groups                   ScripConditions        
Attachments              Links                    Scrips                 
Attributes               ObjectCustomFieldValues  Templates              
CachedGroupMembers       ObjectCustomFields       Tickets                
CustomFieldValues        Principals               Transactions           
CustomFields             Queues                   Users                  
GroupMembers             ScripActions
).each do |table_name|
  synch.synch(table_name)
end

