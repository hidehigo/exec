class TestSuite:
  def __init__(self):
    self.tests = [] 
  def add(self, test):
    self.tests.append(test)
  def run(self):
    result = TestResult()
    for test in tests:
      test.run(result)
    return result


class TestResult:
  def __init__(self):
    self.runCount = 0
    self.errorCount = 0
  def testStarted(self):
    self.runCount = self.runCount + 1
  def testFailed(self):
    self.errorCount = self.errorCount + 1 
  def summary(self):
    return "%d run, %d failed" % ( self.runCount, self.errorCount )

class TestCase:
  def __init__(self, name):
    self.name = name
  def setUp(self):
    pass
  def run(self):
    result = TestResult()
    result.testStarted()
    self.setUp()
    try:
      method = getattr(self, self.name)
      method()
    except:
      result.testFailed()
    self.tearDown()
    return result
  def tearDown(self):
    pass

class WasRun(TestCase):
  def __init__(self, name):
    self.wasRun = None
    TestCase.__init__(self, name)
  def testMethod(self):
    self.wasRun = 1
    self.log = self.log + "testMethod "
  def testBrokenMethod(self):
    raise Exception
  def setUp(self):
    self.wasRun = None
    self.log = "setUp "
  def tearDown(self):
    self.log = self.log + "tearDown "


