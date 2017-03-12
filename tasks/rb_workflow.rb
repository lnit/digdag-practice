require "bundler/inline"
gemfile(true) do
  source 'https://rubygems.org'
  gem 'rugged'
end


class RbWorkflow
  def setup
    puts "pwd:" + `pwd`
    system 'git clone https://github.com/lnit/ikadb.git ~/digdag-server/workspace/rbdag/ikadb'
  end

  def execute
    puts "pwd:" + `pwd`
    repo = Rugged::Repository.new(File.expand_path('~/digdag-server/workspace/rbdag/ikadb'))
    branch = repo.branches.each_name(:remote) do |n|
      puts n
    end
  end
end
