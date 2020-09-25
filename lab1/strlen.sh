#!/bin/bash

strlen() {
echo "${#1}"
}

interactive_strlen() {
echo "Enter string"
read string
echo "${#string}"
}
