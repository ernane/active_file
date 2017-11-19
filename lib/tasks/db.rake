require 'fileutils'

namespace :db do
  desc 'Limpa todas os arquivos de uma midia'
  task :clear, [:folder] do |_task, args|
    FileUtils.rm Dir["db/#{args.folder}/*.yml"]
  end

  desc 'Popula com os dados definidos no arquivo db/folder/seeds.rb'
  task :seed, [:folder] do
    seed_file = File.expand_path "db/#{folder}/seeds.rb", __FILE__
    load(seed_file) if File.exist?(seed_file)
  end

  desc 'Popula dados definidos no arquivo db/folder/seeds.rb apagando'
  task :reseed, [:folder] => ['db:clear', 'db:seed'] do
  end
end
