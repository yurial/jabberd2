Now you can change sql queries for check password by md5 hash.

Example c2s.xml:
  ...
  <authreg>
    <path>/usr/lib/jabberd</path>
    <module>pgsql</module>

    <ssl-mechanisms>
      <traditional>
        <plain/>
      </traditional>

      <sasl>
        <plain/>
        <external/>
      </sasl>
    </ssl-mechanisms>

    <pgsql>
      ...

      <sql>
        <!-- <create>INSERT INTO authreg ( username, realm ) VALUES ( '%s', '%s' )</create> -->
        <!-- <select>SELECT password FROM authreg WHERE username = '%s' AND realm = '%s'</select> -->
>>>     <login>SELECT count(*) FROM authreg WHERE username = '%s' AND realm = '%s' AND password = MD5('%s')</login>
>>>     <setpassword>UPDATE authreg SET password = MD5('%s') WHERE username = '%s' AND realm = '%s'</setpassword>
        <!-- <delete>DELETE FROM authreg WHERE username = '%s' AND realm = '%s'</delete> -->
      </sql>
    </pgsql>
  </authreg>
  ...
