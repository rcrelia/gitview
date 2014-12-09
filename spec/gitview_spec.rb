require_relative '../spec_helper'
require_relative '../lib/gitview'

### Author::Rick Crelia
## Email::rcrelia@gmail.com

describe Gitview do

  before do
    @g = Gitview.new
  end

#  describe "#repo_exists?" do
#    it "should check for a repo" do
#      expect(@g.repo_exists?).to be_truthy
#    end
#  end

  describe "#repo_name" do
    it "checks for a valid name for the git repo" do
      # this match will fail on names containing anything other than 
      # alphanumeric characters with optional dash and version number"
      # Example of acceptables: foo, foo-1, foo-1.0, foo-1.00
      expect(@g.repo_name).to match(/(^[A-Za-z]+(-[0-9]\.{0,1}[0-9]{,2}){,1}$)/)
    end
  end

  describe "#git_version" do
    it "returns the git version string in a valid form" do
      expect(@g.git_version).to match(/git version \d\.\d\.\d/)
    end
  end 

  describe "#repo_status" do
    it "returns the repo status as either current or not current" do
      expect(@g.repo_status).to match(/urrent/)
    end
  end 

  describe "#repo_user" do
    it "returns the repo username consisting of one or more words" do
      expect(@g.repo_user).to match(/\w+/)
    end
  end 

  describe "#repo_email" do
    it "returns the repo user email in a valid form" do
      expect(@g.repo_email).to match(/\w+@{1}\w+/)
    end
  end 

  describe "#repo_files" do
    it "returns the total number of files in the repo as an integer" do
      expect(@g.repo_files).to be_a(Integer)
    end
    it "will return a positive integer" do
      expect(@g.repo_files).to satisfy { |n| n > 0 }
    end
  end 

  describe "#repo_remotes" do
    it "returns a list of any remotes as an array" do
      expect(@g.repo_remotes).to be_a(Array)
    end
    it "will return a non-negative integer" do
      expect(@g.repo_remotes.count).to satisfy { |n| n >= 0 }
    end
  end 

  describe "#repo_branches" do
    it "returns the number of any branches as an integer" do
      expect(@g.repo_branches).to be_a(Integer)
    end
    it "will return a non-negative integer" do
      expect(@g.repo_branches).to satisfy { |n| n >= 0 }
    end
  end 

  describe "#repo_commits" do
    it "returns the total number of commits as an integer" do
      expect(@g.repo_commits).to be_a(Integer)
    end
    it "will return a positive integer" do
      expect(@g.repo_commits).to satisfy { |n| n > 0 }
    end
  end 

  describe "#repo_firstcommit" do
    it "returns the date of first commit as a string" do
      expect(@g.repo_firstcommit).to be_a(String)
    end
  end 

  describe "#repo_lastcommit" do
    it "returns the date of last commit as a string" do
      expect(@g.repo_lastcommit).to be_a(String)
    end
  end 

  describe "#repo_mostchanged" do
    it "returns a hash" do
      expect(@g.repo_mostchanged).to be_a(Hash)
    end
    it "returns a hash of the 3 files that have the most changes" do
      expect(@g.repo_mostchanged.length).to eq(3)
    end
  end 

  describe "#repo_leastchanged" do
    it "returns a hash" do
      expect(@g.repo_leastchanged).to be_a(Hash)
    end
    it "returns a hash of the 3 files that have the fewest changes" do
      expect(@g.repo_leastchanged.length).to eq(3)
    end
  end 

  describe "#repo_committers" do
    it "returns an array of the most active committers" do
      expect(@g.repo_committers).to be_a(Array)
    end
    it "returns an array of at least 1 elements" do
      expect(@g.repo_committers.length).to be >= 1
    end
  end 


end

