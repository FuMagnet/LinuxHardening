sudo apt update
sudo apt install libpam-google-authenticator
google-authenticator
sudo nano /etc/ssh/sshd_config
          # Change to yes to enable challenge-response passwords (beware issues with
          # some PAM modules and threads)
          ChallengeResponseAuthentication yes
sudo nano /etc/pam.d/sshd
          # Standard Un*x authentication.
          @include common-auth
          auth required pam_google_authenticator.so
systemctl restart ssh
