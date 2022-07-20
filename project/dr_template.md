# Infrastructure

## AWS Zones
Identify your zones here
### Primary site 

Primary side is deployed in zone 1 `us-east-2`
### DR site 

Primary side is deployed in zone 2 `us-west-1`

## Servers and Clusters

### Table 1.1 Summary
| Asset      | Purpose           | Size                                                                   | Qty                                                             | DR                                                                                                           |
|------------|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Ubuntu-Web | Web server  | `t3.micro` | 3 nodes | deployed to DR |
| Udacity | SSH key pair  |  | 1 key | stored on SRE team member machine |
| udacity-najla | AMI  |  | 1 image | created in multiple locations|
| udacity-pg-s | Database  | `db.t2.small` | 2 node | replicated | 
| eks-udacity-node | EKS node  | `t3.mediuml` | 2 node | deployed to DR |
| ALB | Cloud Load Balancer  |  | 1 ALB | created in multiple regions |
| VPC | Networking blueprint  |  | 1 VPC | deployed to DR  |

### Descriptions
More detailed descriptions of each asset identified above.

## DR Plan
### Pre-Steps:
List steps you would perform to setup the infrastructure in the other region. It doesn't have to be super detailed, but high-level should suffice.

Ensure the infrastructure is set up and working in the DR site.
Ensure that the infrastructure as code (IaC) for primary and DR site have no Configuration drift

## Steps:
You won't actually perform these steps, but write out what you would do to "fail-over" your application and database cluster to the other region. Think about all the pieces that were setup and how you would use those in the other region

Point your DNS to your secondary region, to the cloud load balancer so when fail over the single DNS entry at your DNS provider to point to the DR site.

        Edit Route53 to the new ALB provisioned in the DR region


Implement a replicated database and failover your  replication instances to another region

        RDS will automatically promote the Read Replica in the DR region to be the new Regional endpoint in case of failure