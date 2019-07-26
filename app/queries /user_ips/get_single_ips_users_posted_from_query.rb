# frozen_string_literal: true

module UserIps
  class GetSingleIpsUsersPostedFromQuery
    def self.call
      query = <<-SQL
        SELECT DISTINCT users.username, user_ips.ip
        FROM posts
        INNER JOIN users on posts.user_id = users.id
        INNER JOIN user_ips on posts.user_ip_id = user_ips.id
        ORDER BY ip
      SQL

      sql_result = ActiveRecord::Base.connection.execute(query).to_a

      sql_result.group_by { |e| e['ip'] }
                .each { |_, v| v.map! { |e| e['username'] } }
                .reject { |_, v| v.size == 1 }
                .map { |k, v| { ip: k, users: v } }
    end
  end
end
