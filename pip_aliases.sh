DIR_PACK="/home/fef/pip_pack/"
# download packages and store them in DIR_PACK
download_packages(){
  pip download --cache-dir $DIR_PACK "$1"
}

# download packages specified in a file and store them in DIR_PACK
download_packages_r(){
  pip download --cache-dir $DIR_PACK -r "$1"
}

# look in DIR_PACK for packages and install them
install_packages(){
  pip install --no-index --find-links $DIR_PACK "$1"
}

# look in DIR_PACK for packages specified in a file and install them
install_packages_r(){
  pip install --no-index --find-links $DIR_PACK -r "$1"
}


pip_install(){
  download_packages "$1"
  install_packages "$1"
}

pip_install_r(){
  download_packages_r "$1"
  install_packages_r "$1"
}


alias pip_d="download_packages"
alias pip_dr="download_packages_r"
alias pip_i="install_packages"
alias pip_ir="install_packages_r"
alias pip_id="pip_install"
alias pip_idr="pip_install_r"
alias pif='pip freeze'
