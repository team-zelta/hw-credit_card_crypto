# frozen_string_literal: true

require 'rbnacl'

# ModernSymmetricCipher
module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string

    RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text

    simple_box = RbNaCl::SimpleBox.from_secret_key(key)
    simple_box.encrypt(document)
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key

    simple_box = RbNaCl::SimpleBox.from_secret_key(key)
    simple_box.decrypt(encrypted_cc)
  end
end
