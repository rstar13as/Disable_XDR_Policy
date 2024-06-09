import sys
from cbc_sdk import CBCloudAPI
from cbc_sdk.platform import Policy

cb = CBCloudAPI(profile="YOUR CREDENTIAL REFERENCE HERE")
policies = cb.select(Policy).all()
collect_true_false = False
for policy in policies:
    policy.set_xdr_collection(collect_true_false)
    print("Policy {} has had XDR collection set to {}".format(policy.id, collect_true_false))
