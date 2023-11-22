# Post HashiStack Deployment Health Checks

## Smoke Test by Running a Simple Job

1. Check that you can access the Nomad console, to do this take the client ip address output from applying the terraform configuration and append ":4646" to the end of it.
   Past this into your browser address bar and you should see the following.
   
<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/png_images/01-nomad-console-init.png?raw=true">

   Click on the link in the middle of the screen to log into the console directory using a token.

2. Supply the token string stored in the NOMAD_TOKEN environment variable ( ```export NOMAD_TOKEN=$(cat nomad.token)``` ):

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/png_images/02-nomad-console-token.png?raw=true">

3. Once logged in, you should be presented with this screen:

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/png_images/03-nomad-console-logged-in.png?raw=true">

4. Currently there are no jobs running on your Nomad cluster, so lets create a simple Nomad job spec file:
```
$ nomad job init --short
```
   this will result in a file being created called example.nomad.hcl with the following contents:
```
job "example" {

  group "cache" {
    network {
      port "db" {
        to = 6379
      }
    }

    task "redis" {
      driver = "docker"

      config {
        image          = "redis:7"
        ports          = ["db"]
        auth_soft_fail = true
      }

      identity {
        env  = true
        file = true
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
```   

6. Check what Nomad will do when the job is submitted:

```
$ nomad job plan example.nomad.hcl
```
   this should result in the following output:
```
+ Job: "example"
+ Task Group: "cache" (1 create)
  + Task: "redis" (forces create)

Scheduler dry-run:
- All tasks successfully allocated.

Job Modify Index: 0
To submit the job with version verification run:

nomad job run -check-index 0 example.nomad.hcl

When running the job with the check-index flag, the job will only be run if the
job modify index given matches the server-side version. If the index has
changed, another user has modified the job and the plan's results are
potentially invalid.
```

7. Submit the job:
```
nomad job run -check-index 0 example.nomad.hcl
```
   The resulting output should look like:
```
==> 2023-11-22T12:46:12Z: Monitoring evaluation "19975b05"
    2023-11-22T12:46:12Z: Evaluation triggered by job "example"
    2023-11-22T12:46:12Z: Evaluation within deployment: "114e1dbd"
    2023-11-22T12:46:12Z: Allocation "5ca45aee" created: node "46c0e5f8", group "cache"
    2023-11-22T12:46:12Z: Evaluation status changed: "pending" -> "complete"
==> 2023-11-22T12:46:12Z: Evaluation "19975b05" finished with status "complete"
==> 2023-11-22T12:46:12Z: Monitoring deployment "114e1dbd"
  ✓ Deployment "114e1dbd" successful
    
    2023-11-22T12:46:29Z
    ID          = 114e1dbd
    Job ID      = example
    Job Version = 0
    Status      = successful
    Description = Deployment completed successfully
    
    Deployed
    Task Group  Desired  Placed  Healthy  Unhealthy  Progress Deadline
    cache       1        1       1        0          2023-11-22T12:56:27Z
```

8. Inspect the job in the Nomad console:

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/png_images/04-nomad-job.png?raw=true">

9. Click on 'example' the name of the job to view it in greater detail:

<img style="float: left; margin: 0px 15px 15px 0px;" src="https://github.com/chrisadkin/Nomad-HashiStack-Lab/blob/main/png_images/05-nomad-job-detail.png?raw=true">
    
   
   
