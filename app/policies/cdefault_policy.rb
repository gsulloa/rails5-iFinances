class CdefaultPolicy < AdminPolicy
	def destroy?
		record.destroy? and user.admin?
	end
end