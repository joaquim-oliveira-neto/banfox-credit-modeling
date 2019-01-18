class Subdomain
    def self.matches? request
        case request.subdomain
        when 'consultas'
            true
        else
            false
        end
    end
end
