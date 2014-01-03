class TestCase:
  def __init__(self, name):
    self.name = name
  def setUp(self):
    pass
  def run(self):
    self.setUp()
    method = getattr(self, self.name)
    method()

class WasRun(TestCase):
  def __init__(self, name):
    self.wasRun = None
    TestCase.__init__(self, name)
  def testMethod(self):
    self.wasRun = 1
  def setUp(self):
    self.wasSetUp = 1


