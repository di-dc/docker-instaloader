#!/bin/sh

args="$(cat "$1" | xargs)"

targets="$(cat "$2" | xargs)"

instaloader $args $targets
