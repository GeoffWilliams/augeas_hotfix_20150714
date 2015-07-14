# augeas_hotfix_20150714

## Module Description

Hotfix - Support for negated command alias in /etc/sudoers

---
Created: 2015-07-14
# Associated Jira/GH Tickets:
* [Augeas sudoers lens does not allow negated command aliases](https://tickets.puppetlabs.com/browse/PE-10943)
* [Sudoers lens doesn't suppot `!`](https://github.com/hercules-team/augeas/issues/262)
#Link
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
Simply include this puppet module on nodes that requre the ability to parse negated command aliases in the `/etc/sudoers` file.  E.g.:

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
