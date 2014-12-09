##
# This class is used to gather git repo information using backticks or
# system(). None of the methods expects parameters to be passed into them.
# Future versions will take arguments for more extensible operation.

class Gitview

  ### Author::Rick Crelia
  ### Email::rcrelia@gmail.com

  include Enumerable

  ##
  # Checks to see if a repo exists in the current working directory.
  # If one is not found, the program is aborted.

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

  ##
  # Use the name of the current working directory as the name of the
  # git repository.

  def repo_name
    @repo_name = `git rev-parse --show-toplevel`.chomp.split("/").last
    @repo_name.to_s
    "#{@repo_name}"
  end

  ##
  # Get the version of git

  def git_version
    @git_version = `git --version`.chomp
  end

  ##
  # Check the repo to see if it is current or not

  def repo_status
    status = system("git status --porcelain -z")
    if status == ""
      @repo_status = "Not current!"
    else
      @repo_status = "Current"
    end
  end

  ##
  # Determine repo user name. If unset locally and globally, "unset" is reported.

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

  ##
  # Determine repo user email. If unset locally and globally, "unset@unset"
  # is reported.

  def repo_email
    local_email = `git config --local user.email`
    global_email = `git config --global user.email`
    if local_email == ""
      @repo_email = global_email
      @repo_email = "unset@unset" if global_email == ""
    else
      @repo_email = local_email
    end
  end

  ##
  # Count files in the repository.

  def repo_files
    @repo_files = `git ls-files`.split(/\n/).length
  end

  ##
  # Gather list of non-local copies of the repository.

  def repo_remotes
    @repo_remotes = `git remote -v`.split(/\n/)
  end

  ##
  # Count branches of the repository.

  def repo_branches
    branches = `git branch`.split(/\n/)
    @repo_branches = branches.select { |b| b !~ /master.*/ }
    @repo_branches.count
  end

  ##
  # Count total commits in the master branch excluding merges.

  def repo_commits
    @@repo_commits = `git log master --no-merges --reverse --format="%ai"`.split(/\n/)
    @@repo_commits.count
  end

  ##
  # Identify first commit in the repository.

  def repo_firstcommit
    # let's reuse the class variable @@repo_commits
    @@repo_commits.first
  end

  ##
  # Identify most recent commit in the repository.

  def repo_lastcommit
    # let's reuse the class variable @@repo_commits
    @@repo_commits.last
  end

  ##
  # Identify most changed files in the repository

  def repo_mostchanged
    changes = `git log master --pretty=format: --name-only`.split(/\n/)
    mostchanged = changes.select { |c| c =~ /[[:alpha:]]/ }
    deduped = Hash.new 0
    mostchanged.each { |v| deduped.store(v,deduped[v]+1) }
    @@allchanged = deduped.sort_by { |k, v| v }
    mc = @@allchanged.last(3).reverse
    @repo_mostchanged = Hash[*mc.flatten]
  end

  ##
  # Identify least changed files in the repository, using the class array
  # @@allchanged created by repo_mostchanged()

  def repo_leastchanged
    # let's reuse our deduped array from repo_mostchanged()
    lc = @@allchanged.first(3).reverse
    @repo_leastchanged = Hash[*lc.flatten]
  end

  ##
  # Use output of git shortlog -sn and truncate to array with first 3 lines
  # to create a list of the 3 most active committers to the repository.

  def repo_committers
    committers = `git shortlog -sn`.split(/\n/)
    @repo_committers = committers.values_at(0..2)
  end

end
