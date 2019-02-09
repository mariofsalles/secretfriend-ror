web: puma -p $PORT -C ./config/puma.rb 
jobs: sidekiq -q emails
mailcatcher: ruby -rbundler/setup -e "Bundler.clean_exec('mailcatcher', '--foreground')"
