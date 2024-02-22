class S4cmd < Formula
  include Language::Python::Virtualenv

  desc "Super S3 command-line tool"
  homepage "https://github.com/bloomreach/s4cmd"
  url "https://files.pythonhosted.org/packages/42/b4/0061f4930958cd790098738659c1c39f8feaf688e698142435eedaa4ae34/s4cmd-2.1.0.tar.gz"
  sha256 "42566058a74d3e1e553351966efaaffa08e4b6ac28a19e72a51be21151ea9534"
  license "Apache-2.0"
  revision 2
  head "https://github.com/bloomreach/s4cmd.git", branch: "master"

  bottle do
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "dfa74e751836c043bb6d908e92f59818408e7eed6bb701d4cfe02feff676f587"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "11adfe8f1c87eb35d70d950465d4c9ff92482cf0da8ad84a1d02d09c1cd76820"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d7e56759aef5c24f86c1152e52c565de712f9706bb4111595e80c8ae895de180"
    sha256 cellar: :any_skip_relocation, sonoma:         "854f04b313ddbc68dfb859749c49f343cdbcd384c278ae6e2d11b5b913076366"
    sha256 cellar: :any_skip_relocation, ventura:        "c8f40364d09dcb7c9a72ebcc7b0aaf1f1d438ce7ccef44b6054becd37b0fd601"
    sha256 cellar: :any_skip_relocation, monterey:       "681ddc2aba08ba18ec2d3bb4db42f3ba3a45cdcfce973ca24b3536fbf2dbf70f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "d8aa586e1f2f5f8c89f67f21ca0be9a3fe654263947ba34fd0634e3809dd94fa"
  end

  depends_on "python@3.12"

  resource "boto3" do
    url "https://files.pythonhosted.org/packages/89/51/8b7c07768bef5756cdc38b3168b228139d2ff1ddd782e515f1c0f2c35a2a/boto3-1.34.47.tar.gz"
    sha256 "7574afd70c767fdbb19726565a67b47291e1e35ec792c9fbb8ee63cb3f630d45"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/93/cf/8c9516f6b1fb859e7fcb7413942b51573b54113307a92db46a44497a3b96/botocore-1.34.47.tar.gz"
    sha256 "29f1d6659602c5d79749eca7430857f7a48dd02e597d0ea4a95a83c47847993e"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6/jmespath-1.0.1.tar.gz"
    sha256 "90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/90/26/9f1f00a5d021fff16dee3de13d43e5e978f3d58928e129c3a62cf7eb9738/pytz-2024.1.tar.gz"
    sha256 "2a29735ea9c18baf14b448846bde5a48030ed267578472d8955cd0e7443a9812"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/a0/b5/4c570b08cb85fdcc65037b5229e00412583bb38d974efecb7ec3495f40ba/s3transfer-0.10.0.tar.gz"
    sha256 "d0c8bbf672d5eebbe4e57945e23b972d963f07d82f661cabf678a5c88831595b"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/af/47/b215df9f71b4fdba1025fc05a77db2ad243fa0926755a52c5e71659f4e3c/urllib3-2.0.7.tar.gz"
    sha256 "c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Unable to locate credentials", shell_output("#{bin}/s4cmd ls s3://brew-test 2>&1", 1)
    assert_match version.to_s, shell_output("#{bin}/s4cmd --version")
  end
end
