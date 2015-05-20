#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module DeliverySugar
  class Change
    attr_reader :enterprise, :organization, :project, :pipeline,
                :stage

    def initialize(node)
      change = node['delivery']['change']
      @enterprise = change['enterprise']
      @organization = change['organization']
      @project = change['project']
      @pipeline = change['pipeline']
      @stage = change['stage']
    end

    def acceptance_environment
      "acceptance-#{@enterprise}-#{@organization}-#{@project}-#{@pipeline}"
    end

    def environment_for_current_stage
      @stage == 'acceptance' ? acceptance_environment : @stage
    end
  end
end
