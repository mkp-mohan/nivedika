class GraphsController < ApplicationController
  helper_method :group_count
  include HTTParty
  base_uri 'https://jira.atlassian.com/rest/api/latest'
  format :json
  default_options.update(verify: false)

  def sprint
    @this_project = params[:project]
    @issues_json = self.class.get("/search?jql=project='#{@this_project}'")
    @issues_result = JSON.parse(@issues_json.body)
    @issues_array = @issues_result['issues']
    @issues_array_hash = []
    @issues_array.each do |project|
      #if project['fields']['assignee'] == []
        @temp_hash = {:key => project['key'],:status => project['fields']['status']['name'],
                      :reporter =>project['fields']['reporter']['displayName'],
                      :issuetype => project['fields']['issuetype']['name'],
                      :assignee => 'Unassigned',
                      :created => project['fields']['created']}
      #else
        #@temp_hash = {:key => project['key'],:status => project['fields']['status']['name'],
        #            :reporter =>project['fields']['reporter']['displayName'],
        #            :issuetype => project['fields']['issuetype']['name'],
        #            :assignee => project['fields']['assignee']['displayName'],
        #            :created => project['fields']['created']}
     # end
      @issues_array_hash <<= @temp_hash
    end
    @issues_array_hash

  end
  def group_count(hash_array,column)

    @result_hash = {}
    @unique_elements =[]
    hash_array.each{|y| @unique_elements<< y[column] }
    @unique_elements.uniq!
    @unique_elements.each do |grouped_element|
      @count_hash =hash_array.select{|x| x[column] == grouped_element }
      @result_hash[grouped_element] = @count_hash.size
    end

    @result_hash
  end


end
