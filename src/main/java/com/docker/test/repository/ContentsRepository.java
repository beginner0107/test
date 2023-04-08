package com.docker.test.repository;

import com.docker.test.entity.Contents;
import org.springframework.data.repository.CrudRepository;

public interface ContentsRepository extends CrudRepository<Contents, Long> {
}
