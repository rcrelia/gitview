class Gitview

  ### Author::Rick Crelia
  ### Email::rcrelia@gmail.com
  
  include Enumerable

  def repo_exists?
    direxists = File.directory?("./.git")
    if direxists == false
      abort "No repo found in current working directory!\n\n"
    else
      cfgexists = File.exists?("./.git/config")
      if cfgexists == false
        abort "No repo config found!\n\n"
      else
        @repo_exists = true
      end
    end
  end

  def repo_name
    @repo_name = `git rev-parse --show-toplevel`.chomp.split("/").last
    @repo_name.to_s
    "#{@repo_name}"
  end

  def git_version
    @git_version = `git --version`.chomp #needs test
  end

  def repo_status
    status = system("git status --porcelain -z")
    if status == ""
      @repo_status = "Not current!"
    else
      @repo_status = "Current"
    end 
  end

  def repo_user
    local_user = `git config --local user.name`
    global_user = `git config --global user.name`
    if local_user == ""
      @repo_user = global_user
      @repo_user = "unset" if global_user == ""
    else
      @repo_user = local_user
    end
  end

  def repo_email
    local_email = `git config --local user.email`
    global_email = `git config --global user.email`
    if local_email == ""
      @repo_email = global_email
      @repo_email = "unset" if global_email == ""
    else
      @repo_email = local_email
    end
  end

  def repo_files
    @repo_files = `git ls-files`.split(/\n/).length
  end

  def repo_remotes
    @repo_remotes = `git remote -v`.split(/\n/)
    @repo_remotes.each { |r| puts "#{r}" }
    @repo_remotes
  end

  def repo_branches  # needs testing
    branches = `git branch`.split(/\n/)
    @repo_branches = branches.select { |b| b !~ /master.*/ }
    @repo_branches.count
  end

  def repo_commits
    @@repo_commits = `git log master --no-merges --reverse --format="%ai"`.split(/\n/)
    @@repo_commits.count
  end

  def repo_firstcommit
    # let's reuse the class variable @@repo_commits
    @@repo_commits.first
  end

  def repo_lastcommit
    # let's reuse the class variable @@repo_commits
    @@repo_commits.last
  end

  def repo_mostchanged
    # here's how to do this using shell utils with system call:
    #@repo_mostchanged = `git log master --pretty=format: --name-only|grep -i [a-z]|sort|uniq -c |sort -rg|head -3`
    changes = `git log master --pretty=format: --name-only`.split(/\n/)
    mostchanged = changes.select { |c| c =~ /[[:alpha:]]/ }
    deduped = Hash.new 0
    mostchanged.each { |v| deduped.store(v,deduped[v]+1) }
    @@allchanged = deduped.sort_by { |k, v| v }
    mc = @@allchanged.last(3).reverse
    @repo_mostchanged = Hash[*mc.flatten]
  end

  def repo_leastchanged
    # let's reuse our deduped array from repo_mostchanged()
    lc = @@allchanged.first(3).reverse
    @repo_leastchanged = Hash[*lc.flatten]
  end

  def repo_committers
    # take output of git shortlog -sn and truncate to array with first 3 lines
    committers = `git shortlog -sn`.split(/\n/)
    @repo_committers = committers.values_at(0..2)
  end

end
