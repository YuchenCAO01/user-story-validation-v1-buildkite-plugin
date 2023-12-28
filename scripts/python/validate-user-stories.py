#!/usr/bin/env python

import sys
import yaml

def validate_user_stories(file_path):
    try:
        with open(file_path, 'r') as file:
            user_stories = yaml.safe_load(file)

        # Validation logic here
        for story in user_stories['user-stories']:
            if 'As a' not in story or 'I want to' not in story or 'so that' not in story:
                print(f"Invalid story format: {story}")
            else:
                print(f"Valid story: {story}")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: validate-user-stories.py <path-to-user-stories-file>")
        sys.exit(1)

    validate_user_stories(sys.argv[1])
