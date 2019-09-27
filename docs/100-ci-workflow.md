### CI-Workflow (Azure) @PXG

- Pull Request (with target branch: master)
  - Webhook 
    - OnCreate => triggers TestRun
    - OnUpdate => triggers TestRun
  - Merge Policies
    - Reviewer Approval
    - Technical Test
    - Auto. resets after change PR Update
    
- Branch: master
  - Webhook
    - OnUpdate => triggers Deployment (staging/production)

- Testing Environment (multiple)
  - k8s pod
    - app
    - db
    - redis
    - elasticsearch
  - public url (frontend/backend)
  - build any branch