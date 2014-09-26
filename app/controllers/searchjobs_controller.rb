class SearchjobsController < ApplicationController
  def searchmyjobs
       @jobseekerid = session[:user_id]
  end

  def viewjobsbysearchcriteria
  #render :text =>params
  searchcriteria = params[:searchcriteria]
  select_searchcriteria = params[:searchcriteria_select]

  s = select_searchcriteria.match('Job Title')
  #render :text=> select_searchcriteria.match('Job Title')

  if select_searchcriteria.match('jobtitle')
    #render :text=>session[:user_id].class
    @jobs = Job.find_by_sql("select * from jobs where UPPER(title) like UPPER('%#{searchcriteria}%')
EXCEPT
select * from jobs where id in (select job_id from jobapplications where jobseeker_id = #{session[:user_id]} AND job_id in (select id  from jobs where UPPER(title) like UPPER('%#{searchcriteria}%')))")

  end

  if select_searchcriteria.match('jobdescription')
    #@jobs = Job.where("description like ?","%#{searchcriteria}%")
    @jobs = Job.find_by_sql("select * from jobs where UPPER(description) like UPPER('%#{searchcriteria}%')
EXCEPT
select * from jobs where id in (select job_id from jobapplications where jobseeker_id = #{session[:user_id]} AND job_id in (select id  from jobs where UPPER(description) like UPPER('%#{searchcriteria}%')))")
 end

  if select_searchcriteria.match('employername')
    @jobs = Job.find_by_sql("SELECT * FROM JOBS WHERE employers_id in (select id from employers where UPPER(company) like UPPER('%#{searchcriteria}%'))  AND  id in (select job_id from jobapplications where jobseeker_id in (select jobseeker_id FROM jobapplications EXCEPT select jobseeker_id from jobapplications where jobseeker_id = #{session[:user_id]}))")

  end

  if select_searchcriteria.match('tags')
    @jobs = Job.find_by_sql(" select * from jobs where id in  (select job_id from jobtags where tag_id in  (select id from tags where UPPER(tag) like UPPER('%#{searchcriteria}%')))
EXCEPT
select * from jobs where id in (select job_id from jobapplications where jobseeker_id = #{session[:user_id]} AND job_id in (select job_id from jobtags where tag_id in  (select id from tags where UPPER(tag) like UPPER('%#{searchcriteria}%'))))")

  end

  end

  def viewrecommendedjobs
    #render :text=> request.path_parameters
    jobapplication_id = request.path_parameters[:format]
    @jobapplication_id = jobapplication_id.to_i
    #render :text=>@tags.inspect
  end
end