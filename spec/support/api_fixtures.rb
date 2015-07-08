def fixture_file(file)
  # lita-github-web-hooks invokes JSON parsing on payload.
  MultiJson.load(File.read(File.join(File.dirname(__FILE__), "../fixtures/#{file}.json")))
end

def api_projects
  '{"expand":"projects","link":{"href":"https://52.7.175.52:8085/rest/api/latest/project","rel":"self"},"projects":{"size":6,"expand":"project","start-index":0,"max-result":6,"project":[{"expand":"plans","key":"CRABBIT","name":"CrowdRabbit","link":{"href":"https://bamboo.qsfllc.info/rest/api/latest/project/CRABBIT","rel":"self"},"plans":{"size":1,"start-index":0,"max-result":1}},{"expand":"plans","key":"TT","name":"Trader Tool","link":{"href":"https://bamboo.qsfllc.info/rest/api/latest/project/TT","rel":"self"},"plans":{"size":1,"start-index":0,"max-result":1}},{"expand":"plans","key":"CWE","name":"Investor Management Services","link":{"href":"https://bamboo.qsfllc.info/rest/api/latest/project/CWE","rel":"self"},"plans":{"size":1,"start-index":0,"max-result":1}},{"expand":"plans","key":"AS","name":"Asset-Reviewers-API","link":{"href":"https://bamboo.qsfllc.info/rest/api/latest/project/AS","rel":"self"},"plans":{"size":1,"start-index":0,"max-result":1}},{"expand":"plans","key":"ASRF","name":"Asset-Reviewers-Frontend","link":{"href":"https://bamboo.qsfllc.info/rest/api/latest/project/ASRF","rel":"self"},"plans":{"size":1,"start-index":0,"max-result":1}},{"expand":"plans","key":"MIC","name":"microservice-documents","link":{"href":"https://bamboo.qsfllc.info/rest/api/latest/project/MIC","rel":"self"},"plans":{"size":1,"start-index":0,"max-result":1}}]}}'  
end

def api_plans
  '{"expand":"plans","link":{"href":"http://52.7.175.52:8085/rest/api/latest/plan","rel":"self"},"plans":{"size":2,"expand":"plan","start-index":0,"max-result":2,"plan":[{"shortName":"Tests","shortKey":"RSPEC","type":"chain","enabled":true,"link":{"href":"http://52.7.175.52:8085/rest/api/latest/plan/CWE-RSPEC","rel":"self"},"key":"CWE-RSPEC","name":"CrowdWithEase - Tests","planKey":{"key":"CWE-RSPEC"}},{"shortName":"RSPEC","shortKey":"RSPEC","type":"chain","enabled":true,"link":{"href":"http://52.7.175.52:8085/rest/api/latest/plan/TT-RSPEC","rel":"self"},"key":"TT-RSPEC","name":"Trader Tool - RSPEC","planKey":{"key":"TT-RSPEC"}}]}}'
end

def api_empty_queue
<<-EMPTY_QUEUE
{
 "expand": "queuedBuilds",
 "queuedBuilds": {
  "size": 0,
  "expand": "queuedBuild",
  "queuedBuild": [],
  "max-result": 0,
  "start-index": 0
 },
 "link": {
  "href": "http://52.7.175.52:8085/rest/api/latest/queue",
  "rel": "self"
 }
}
EMPTY_QUEUE
end

def api_nonempty_queue
<<-NONEMPTY_QUEUE
  {
   "expand": "queuedBuilds",
   "link": {
    "href": "http://52.7.175.52:8085/rest/api/latest/queue",
    "rel": "self"
   },
   "queuedBuilds": {
    "size": 1,
    "max-result": 1,
    "expand": "queuedBuild",
    "queuedBuild": [
     {
      "planKey": "CWE-RSPEC-JOB1",
      "buildNumber": 7,
      "triggerReason": "Manual build",
      "buildResultKey": "CWE-RSPEC-JOB1-7",
      "link": {
       "href": "http://52.7.175.52:8085/rest/api/latest/result/CWE-RSPEC-JOB1-7",
       "rel": "self"
      }
     }
    ],
    "start-index": 0
   }
  }
NONEMPTY_QUEUE
end

def api_plan_enqueued
<<-PLAN_ENQUEUED
{
 "planKey": "TT-RSPEC",
 "triggerReason": "Manual build",
 "buildNumber": 52,
 "buildResultKey": "TT-RSPEC-52",
 "link": {
  "href": "http://52.7.175.52:8085/rest/api/latest/result/TT-RSPEC-52",
  "rel": "self"
 }
}
PLAN_ENQUEUED
end