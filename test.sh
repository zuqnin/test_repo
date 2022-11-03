#!/bin/bash

read - p "Do you have an SSH key? If yes then connect to remote host (yes/no): " answer

case $answer in
            yes)
                  read -p "Enter the key file: " ready_key
                  
                  read -p "Enter the name for remote host (Host <host>): " Host

                  read -p "Enter the user's name of the remote host (User <user>): " User

                  read -p "Enter the IP Address of the remote host (Hostname <hostname>): " Hostname


                  echo -e "\x1B[96m ################### ~/.ssh/config file changing… ################### \x1B[0m"

                  echo -e "Host $Host\n  User $User\n  Hostname $Hostname\n  IdentityFile $output_keyfile\n  VisualHostKey yes" > ~/.ssh/config


                  echo -e "\x1B[96m ################### copy SSH key on a $Hostname ################### \x1B[0m"

                  ssh-copy-id -i $output_keyfile $User@$Hostname

                  if [ "$?" != 0 ]; then

                               echo -e "\x1B[31m ################### Check /etc/ssh/sshd_config file on remote host and change 'PermitRootLogin' and 'PasswordAuthentication ################### \x1B[0m"

                  else

                               echo -e "\x1B[96m ################### Adding ssh-agent… ################### \x1B[0m"
                             
                               eval $(ssh-agent -s)

                               ssh-add $output_keyfile

                               read -p "Do you want to connect to the remote host via SSH? (yes/no): " ssh_connect

                               case $ssh_connect in

                                                    yes)

                                                            echo -e "\x1B[32m ################### Connecting… ################### \x1B[0m"

                                                            ssh -i $output_keyfile $User@$Hostname
                                                            ;;

                                                    no)

                                                            echo -e "\x1B[32m ################### Ok! ################### \x1B[0m"
                                                            ;;

                               esac

                  fi
            no)
                  
                  read -p "Choose key type (ecdsa, ecdsa-sk, ed25519, ed25519-sk, rsa): " keytype

                  read -p "Enter file in which to save the key: " output_keyfile

                  read -p "Enter a key comment: " comment

                  read -p "Enter passphrase: " passphrase

                  case $keytype in

                                  ecdsa)

                                          echo -e "\x1B[96m ################### ecdsa key selected… ################### \x1B[0m"

                                          read -p "Choose bit length for ecdsa key (256,384,521): " ecdsa_bit

                                          ssh-keygen -t ecdsa -b $ecdsa_bit -f $output_keyfile -C "$comment" -P $passphrase
                                          ;;

                                  ecdsa_sk)

                                          echo -e "\x1B[96m ################### ecdsa-sk key selected… ################### \x1B[0m"

                                          ssh-keygen -t ecdsa-sk -C "$comment" -P $passphrase
                                          ;;

                                  ed25519)

                                          echo -e "\x1B[96m ################### ed25519 key selected… ################### \x1B[0m"

                                          read -p "Numbers of KDF (Key Derivation Function): " number1

                                          ssh-keygen -o -a $number1 -t ed25519 -f $output_keyfile -C "$comment" -P $passphrase
                                          ;;

                                  ed25519-sk)

                                          echo -e "\x1B[96m ################### ed25519-sk key selected… ################### \x1B[0m"

                                          read -p "Numbers of KDF (Key Derivation Function): " number2

                                          ssh-keygen -o -a $number2 -t ed25519-sk -f $output_keyfile -C "$comment" -P $passphrase
                                          ;;

                                  rsa)

                                          echo -e "\x1B[96m ################### rsa key selected… ################### \x1B[0m"

                                          read -p "Choose bit length for rsa key (1024,2048,3072,4096): " rsa_bit

                                          ssh-keygen -t rsa -b $rsa_bit -f $output_keyfile -C "$comment" -P $passphrase
                                          ;;

                  esac


                  read -p "Enter the name for remote host (Host <host>): " Host

                  read -p "Enter the user's name of the remote host (User <user>): " User

                  read -p "Enter the IP Address of the remote host (Hostname <hostname>): " Hostname


                  echo -e "\x1B[96m ################### ~/.ssh/config file changing… ################### \x1B[0m"

                  echo -e "Host $Host\n  User $User\n  Hostname $Hostname\n  IdentityFile $output_keyfile\n  VisualHostKey yes" > ~/.ssh/config


                  echo -e "\x1B[96m ################### copy SSH key on a $Hostname ################### \x1B[0m"

                  ssh-copy-id -i $output_keyfile $User@$Hostname

                  if [ "$?" != 0 ]; then

                                echo -e "\x1B[31m ################### Check /etc/ssh/sshd_config file on remote host and change 'PermitRootLogin' and 'PasswordAuthentication ################### \x1B[0m"


                  else

                                echo -e "\x1B[96m ################### Adding ssh-agent… ################### \x1B[0m"

                                eval $(ssh-agent -s)

                                ssh-add $output_keyfile

                                read -p "Do you want to connect to the remote host via SSH? (yes/no): " ssh_connect

                                case $ssh_connect in

                                                     yes)

                                                          echo -e "\x1B[32m ################### Connecting… ################### \x1B[0m"

                                                          ssh -i $output_keyfile $User@$Hostname
                                                          ;;

                                                     no)

                                                          echo -e "\x1B[32m ################### Ok! ################### \x1B[0m"
                                                          ;;

                                esac

                  fi
