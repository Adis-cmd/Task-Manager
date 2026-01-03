package com.example.taskmanager.repo;

import com.example.taskmanager.entity.user.Authority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface AuthorityRepository extends JpaRepository<Authority, Long> {

    @Query("SELECT a FROM Authority a WHERE a.name = :name")
    Optional<Authority> findAuthorityByName(@Param("name") String name);
}
