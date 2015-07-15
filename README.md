# puppetlabs-augeas_sudoers_hotfix
[![Build Status](https://travis-ci.org/GeoffWilliams/augeas_hotfix_20150714.svg?branch=master)](https://travis-ci.org/GeoffWilliams/augeas_hotfix_20150714)
## Module Description

Hotfix - Support for negated command alias in /etc/sudoers

---
Created: 2015-07-14
# Associated Jira/GH Tickets:
* [Augeas sudoers lens does not allow negated command aliases](https://tickets.puppetlabs.com/browse/PE-10943)
* [Sudoers lens doesn't suppot `!`](https://github.com/hercules-team/augeas/issues/262)

# Link
* [Error: /Stage\[main\]/Sudo/Augeas\[includedirsudoers\]: Could not evaluate: Saving failed](https://puppetlabs.zendesk.com/agent/tickets/12693)

# What the hotfix does
* Installs a fixed version of the sudoers lens
* Installs an updated lens testcase

# Applies to version(s)
* Puppet Enterprise 3.7.2 - 3.8.1

Applying this patch to any versions but those listed above may have unexpected or negative consequences. Hotfixes are included in the next upcoming Puppet Enterprise release and will not need to be applied.

# Platform restrictions
This hotfix is platform independent

#How to Apply
First, on each puppet master:

Install the module included in this hotfix on the master using the following command (adjust path to the module as needed): 
```
/opt/puppet/bin/puppet module install puppetlabs-augeas_sudoers_hotfix-0.1.0.tar.gz
```
Next, on the console:

To apply the fix to specific nodes:

1. Log into the console.
2. Go to the Classification tab in the console.
3. Set a value of 'augeas_sudoers_hotfix' for 'Node group name' and click 'Add group'.
4. Click on the 'augeas_sudoers_hotfix' group link.
5. On the Rules tab, in the 'Certname' box, select a host and click 'Pin node'. (Repeat for each host.)
6. Select the Matching nodes tab and confirm the list of nodes is correct.
7. Commit the change (link is to the bottom right of the screen).
8. Click the Classes tab.
9. On the Classes tab, select 'augeas_hotfix_20150714' and click 'Add class'.
10. Commit the change (link is to the bottom right of the screen).

Alternatively, simply include this puppet module on nodes that requre the ability to parse negated command aliases in the `/etc/sudoers` file.  E.g.:

```puppet
include augeas_hotfix_20150714
```

#How to confirm resolution
On a node with this hotfix applied, line 121 of `/opt/puppet/share/augeas/lenses/dist/sudoers.aug` should read:
```augeas
let sto_to_com_cmnd = del_negate . negate_node? . (
```

Alternatively, you can confirm resulution by adding a negated command alias to `/etc/sudoers` and then attempt to process it:
```shell
/opt/puppet/bin/augtool print /augeas//error
```
This command will return no output if the hotfix is applied and working

#Supportability of this hotfix

Puppet Labs will continue to support the use of this hotfix for 90 days following the next release. All hotfixes are fixed in the following minor release. Ex. a hotfix for PE 3.7.2 will be included in 3.7.3 and 3.8

#Other Notes

Once this issue is addressed in-product, this module should be removed from the puppet master and all node classifications to preven future fixes being reverted.
