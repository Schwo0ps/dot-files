#!/bin/bash

run_once() {
  mkdir -p .github
  echo '* @Schwo0ps @ppbrown @rsinnet' > .github/CODEOWNERS
  git add .github/CODEOWNERS
  git commit -m 'Add CODEOWNERS'
  git push
}

repos=(
  git@github.com:MisoRobotics/ansible-misorobotics.general.git
  git@github.com:MisoRobotics/cloudbuild.git
  git@github.com:MisoRobotics/customer-cloud.git
  git@github.com:MisoRobotics/github-analytics.git
  git@github.com:MisoRobotics/miso-ansible.git
  git@github.com:MisoRobotics/miso-cloud.git
  git@github.com:MisoRobotics/miso-flippy-helm.git
  git@github.com:MisoRobotics/terraform-google-cloudbuild.git
  git@github.com:MisoRobotics/terraform-vpn-hub.git
  git@github.com:MisoRobotics/zerotouchconfig.git
)

main() {
  local failed=()
  for repo in "${repos[@]}"; do
    echo -e "\n*** Cloning into '${repo}' ***\n"
    rm -rf repo
    git clone "${repo}" repo/
    pushd repo
    run_once
    if [[ $? != 0 ]]; then
      failed+=($repo)
    fi
    popd
  done

  if [[ "${#failed[@]}" > 0 ]]; then
    echo -e "\n***** Failed repos:"
    printf " - %s\n" "${failed[@]}"
  else
    echo -e "\n***** All good! *****"
  fi
}

main
