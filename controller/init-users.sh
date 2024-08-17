#!/bin/sh
boundary server -config /boundary/boundary.hcl
boundary scopes create -name 'Main' -scope-id 'global' -recovery-config /boundary/boundary.hcl -skip-admin-role-creation -skip-default-role-creation