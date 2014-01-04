class TestResult:
  def summary(self):
    return "1 run, 0 failed"

class TestCase:
  def __init__(self, name):
    self.name = name
  def setUp(self):
    pass
  def run(self):
    self.setUp()
    method = getattr(self, self.name)
    method()
    self.tearDown()
    return TestResult()
  def tearDown(self):
    pass

class WasRun(TestCase):
  def __init__(self, name):
    self.wasRun = None
    TestCase.__init__(self, name)
  def testMethod(self):
    self.wasRun = 1
    self.log = self.log + "testMethod "
  def setUp(self):
    self.wasRun = None
    self.log = "setUp "
  def tearDown(self):
    self.log = self.log + "tearDown "


