class WelcomeController < ApplicationController
  include HTTParty
  base_uri 'https://jira.atlassian.com/rest/api/latest'
  format :json
  default_options.update(verify: false)

  #ssl_version  :TLSv1
  #ciphers  ['RC4-SHA']

  def index
    @projects_json = self.class.get('/project?fields=name')
    @projects_hash = JSON.parse(@projects_json.body)
    @projects_names = []
    @projects_hash.each do |project|
      @projects_names << project['name']
    end
    @projects_names
  end
end
