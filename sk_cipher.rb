# frozen_string_literal: true

require 'rbnacl'
require 'base64'

# ModernSymmetricCipher
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string

    key = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.strict_encode64(key)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text

    simple_box = RbNaCl::SimpleBox.from_secret_key(Base64.strict_decode64(key))
    ciphertext = simple_box.encrypt(document.to_s)

    Base64.strict_encode64(ciphertext)
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key

    simple_box = RbNaCl::SimpleBox.from_secret_key(Base64.strict_decode64(key))
    simple_box.decrypt(Base64.strict_decode64(encrypted_cc).to_s)
  end
end
